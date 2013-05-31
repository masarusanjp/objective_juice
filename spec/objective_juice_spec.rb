require 'spec_helper'

describe ObjectiveJuice do
  subject { @juice }
  before { @juice = ObjectiveJuice.new }

  describe :converters do
    describe :convert_string do
      it { @juice.convert_string(1).should == '@"1"' }
      it { @juice.convert_string("ruby").should == '@"ruby"' }
      it { @juice.convert_object("ruby").should == '@"ruby"' }
    end

    describe :convert_numeric do
      it { @juice.convert_numeric(1).should == '@(1)' }
      it { @juice.convert_object(1).should == '@(1)' }
    end

    describe :convert_boolean do
      it { @juice.convert_boolean(true).should == "@(YES)" }
      it { @juice.convert_boolean(false).should == "@(NO)" }
      it { @juice.convert_object(true).should == '@(YES)' }
      it { @juice.convert_object(false).should == '@(NO)' }
    end

    describe :convert_nil do
      it { @juice.convert_nil(nil).should == "[NSNull null]" }
      it { @juice.convert_object(nil).should == "[NSNull null]" }
    end

    describe :convert_array do
      it { @juice.convert_array([true, false]).should == "@[@(YES), @(NO)]" }
      it { @juice.convert_object([true, false]).should == "@[@(YES), @(NO)]" }
    end

    describe :convert_hash do
      before { @hash = {"objectve-c" => "is fantastic", "literal-syntax" => ["string", "array", "number", "hash"]} }
      it { @juice.convert_hash(@hash).should == '@{
    @"objectve-c":@"is fantastic",
    @"literal-syntax":@[@"string", @"array", @"number", @"hash"]
}'
      }
      it { @juice.convert_object(@hash).should == '@{
    @"objectve-c":@"is fantastic",
    @"literal-syntax":@[@"string", @"array", @"number", @"hash"]
}'
      }
    end

  end
end
