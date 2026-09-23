sealed class JsonValue {
  const JsonValue();
}

final class JsonNull extends JsonValue {
  const JsonNull();
}

final class JsonBool extends JsonValue {
  const JsonBool(this.value);
  final bool value;
}

final class JsonNumber extends JsonValue {
  const JsonNumber(this.value);
  final double value;
}

final class JsonString extends JsonValue {
  const JsonString(this.value);
  final String value;
}

final class JsonArray extends JsonValue {
  const JsonArray(this.value);
  final List<JsonValue> value;
}

final class JsonObject extends JsonValue {
  const JsonObject(this.value);
  final Map<String, JsonValue> value;
}

typedef JsonMap = Map<String, JsonValue>;
