/// An abstract expression that can be evaluated.
abstract class Expression {
  /// Evaluates the expression with the provided [variables].
  dynamic eval(Map<String, dynamic> variables);
  List<String> getDependencies() => [];
}

/// A value expression.
class Value extends Expression {
  Value(this.value);

  final num value;

  @override
  dynamic eval(Map<String, dynamic> variables) => value;

  @override
  String toString() => 'Value{$value}';
}

/// A variable expression.
class Variable extends Expression {
  Variable(this.name);

  final String name;

  @override
  dynamic eval(Map<String, dynamic> variables) => variables.containsKey(name)
      ? variables[name]!
      : throw ArgumentError.value(name, 'Unknown variable');

  @override
  String toString() => 'Variable{$name}';
}

/// A question expression.
class QuestionValue extends Variable {
  QuestionValue(super.name);

  @override
  List<String> getDependencies() => [name];

  @override
  String toString() => 'Question{$name}';
}

/// A function application.
class Application extends Expression {
  Application(this.name, this.arguments, this.function);

  final String name;
  final List<Expression> arguments;
  final Function function;

  @override
  dynamic eval(Map<String, dynamic> variables) => Function.apply(
      function, arguments.map((argument) => argument.eval(variables)).toList());

  @override
  List<String> getDependencies() {
    var dependencies = <String>{};
    for (var argument in arguments) {
      dependencies.addAll(argument.getDependencies());
    }
    return dependencies.toList();
  }

  @override
  String toString() => 'Application{$name}';
}
