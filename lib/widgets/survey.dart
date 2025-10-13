import 'package:flutter/material.dart';
import '../l10n/lib_localizations.dart';
import './panel.dart';
import '../survey.dart';
import '../themes.dart';

class SurveyWidget extends StatelessWidget {
  final Survey survey;
  final ValueChanged<String>? onThemeChanged;
  final String currentTheme;

  const SurveyWidget(
    this.survey, {
    super.key,
    this.onThemeChanged,
    required this.currentTheme,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: survey.getChangesStreamController('currentPage').stream,
      initialData: survey.currentPage,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final theme = Theme.of(context) as ThemeData;
        return Scaffold(
          appBar:
              survey.title != null
                  ? AppBar(
                    backgroundColor: theme.colorScheme.inversePrimary,
                    title: Text(survey.title!),
                    actions: [
                      PopupMenuButton<Locale>(
                        onSelected: (Locale newLocale) {
                          // Call the method from your provider to change the language
                          // context.read<LocaleNotifier>().changeLocale(
                          //   newLocale,
                          // );
                        },
                        itemBuilder:
                            (BuildContext context) => <PopupMenuEntry<Locale>>[
                              PopupMenuItem<Locale>(
                                value: Locale('en'),
                                child: Text('English'),
                              ),
                              PopupMenuItem<Locale>(
                                value: Locale('de'),
                                child: Text('Deutch'),
                              ),
                              // Add more languages as needed
                            ],
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: currentTheme,
                          items:
                              surveyThemes.keys
                                  .map(
                                    (key) => DropdownMenuItem(
                                      value: key,
                                      child: Text(key),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (String? newTheme) {
                            if (newTheme != null && onThemeChanged != null) {
                              onThemeChanged!(newTheme);
                            }
                          },
                          icon: const Icon(Icons.color_lens),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          survey.setData({
                            "question2": "answer1",
                            "question3": "item1",
                          });
                        },
                        icon: const Icon(Icons.data_array),
                      ),
                    ],
                  )
                  : null,
          drawer:
              survey.showTOC
                  ? Drawer(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        DrawerHeader(
                          decoration: BoxDecoration(
                            color: theme.colorScheme.inversePrimary,
                          ),
                          child: Text(
                            survey.title!,
                            style: theme.textTheme.titleLarge,
                          ),
                        ),
                        ...survey.pages.map(
                          (page) => ListTile(
                            title: Text(
                              page.navTitle,
                              style: TextStyle(
                                fontWeight:
                                    page == survey.currentPage
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
                            ),
                            onTap: () {
                              survey.currentPage = page;
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                  : null,
          body: SingleChildScrollView(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: PanelWidget(survey.currentPage),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(children: getNavigationActions(context)),
          ),
        );
      },
    );
  }

  getNavigationActions(BuildContext context) {
    List<Widget> actions = [];
    if (!survey.isFirstPage) {
      actions.add(
        TextButton.icon(
          onPressed: () {
            survey.goPreviousPage();
          },
          icon: const Icon(Icons.skip_previous),
          label: Text(SurveyLocalizations.of(context)!.previousButton),
          iconAlignment: IconAlignment.start,
        ),
      );
    }
    actions.add(const Spacer());
    actions.add(
      survey.isLastPage
          ? TextButton.icon(
            onPressed: () {
              survey.complete();
            },
            icon: const Icon(Icons.check_circle),
            label: Text(SurveyLocalizations.of(context)!.completeButton),
            iconAlignment: IconAlignment.start,
          )
          : TextButton.icon(
            onPressed: () {
              survey.goNextPage();
            },
            icon: const Icon(Icons.skip_next),
            label: Text(SurveyLocalizations.of(context)!.nextButton),
            iconAlignment: IconAlignment.end,
          ),
    );
    return actions;
  }
}
