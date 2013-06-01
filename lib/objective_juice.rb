require "objective_juice/version"

class ObjectiveJuice
  def self.splash(object, indent_level = 0, break_threshold = 32, indent_spaces = 4)
    instance = self.new(break_threshold, indent_spaces)
    return instance.convert_object(object, indent_level)
  end

  def initialize(break_threshold = 32, indent_spaces = 4)
    @break_threshold = break_threshold
    @indent_string = " " * indent_spaces
  end

  def indent_level_to_space(indent_level)
    return @indent_string * indent_level
  end

  def convert_array(array, indent_level = 0)
    return convert_enum(array, indent_level, "@[", "]") {|v| convert_object(v, indent_level + 1) }
  end

  def convert_hash(hash, indent_level = 0)
    return convert_enum(hash, indent_level, "@{", "}") {|v| "@\"#{v[0]}\":" + convert_object(v[1], indent_level + 1) }
  end

  def convert_enum(enum, indent_level,l_start, l_end)
    lines = []
    is_long = false
    enum.each do |v|
      res = yield v
      is_long = is_long || (res.length > @break_threshold) || res.include?("\n")
      lines << res
    end
    return literalize(lines, is_long, indent_level, l_start, l_end)
  end

  def literalize(items, is_long, indent_level, literal_start, literal_end)
    if items.empty?
      return literal_start + literal_end
    elsif is_long
      indent = indent_level_to_space(indent_level + 1)
      prev_indent = indent_level_to_space(indent_level)
      items.map! {|l| indent + l}
      return "#{literal_start}\n" + items.join(",\n") + "\n#{prev_indent}#{literal_end}"
    else
      return "#{literal_start}#{items.join(", ")}#{literal_end}"
    end
  end

  def convert_string(object)
    return "@\"#{object}\""
  end

  def convert_numeric(object)
    return "@(#{object.to_s})"
  end

  def convert_boolean(object)
    return object ? "@(YES)" : "@(NO)"
  end

  def convert_nil(object)
    return "[NSNull null]"
  end

  def convert_object(object, indent_level = 0)
    case object
    when Hash
      convert_hash(object, indent_level)
    when Array
      convert_array(object, indent_level)
    when String
      convert_string(object)
    when Numeric
      convert_numeric(object)
    when TrueClass, FalseClass
      convert_boolean(object)
    when NilClass
      convert_nil(object)
    else
      convert_string(object.to_s)
    end
  end
end
