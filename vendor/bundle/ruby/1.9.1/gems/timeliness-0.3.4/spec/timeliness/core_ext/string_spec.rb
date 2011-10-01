# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Timeliness::CoreExt, 'String' do
  # Test values taken from ActiveSupport unit tests for compatibility

  describe "#to_time" do
    it 'should convert valid string to Time object in default zone' do
      "2005-02-27 23:50".to_time.should == Time.utc(2005, 2, 27, 23, 50)
    end

    it 'should convert ISO 8601 string to Time object' do
      "2005-02-27T23:50:19.275038".to_time.should == Time.utc(2005, 2, 27, 23, 50, 19, 275038)
    end

    context "with :local" do
      it 'should convert valid string to local time' do
        "2005-02-27 23:50".to_time(:local).should == Time.local(2005, 2, 27, 23, 50)
      end

      it 'should convert ISO 8601 string to local time' do
        "2005-02-27T23:50:19.275038".to_time(:local).should == Time.local(2005, 2, 27, 23, 50, 19, 275038)
      end
    end

    it 'should convert valid future string to Time object' do
      "2039-02-27 23:50".to_time(:local).should == Time.local_time(2039, 2, 27, 23, 50)
    end

    it 'should convert valid future string to Time object' do
      "2039-02-27 23:50".to_time.should == DateTime.civil(2039, 2, 27, 23, 50)
    end

    it 'should convert empty string to nil' do
      ''.to_time.should be_nil
    end
  end

  describe "#to_datetime" do
    it 'should convert valid string to DateTime object' do
      "2039-02-27 23:50".to_datetime.should == DateTime.civil(2039, 2, 27, 23, 50)
    end

    it 'should convert to DateTime object with UTC offset' do
      "2039-02-27 23:50".to_datetime.offset.should == 0
    end

    it 'should convert ISO 8601 string to DateTime object' do
      datetime = DateTime.civil(2039, 2, 27, 23, 50, 19 + Rational(275038, 1000000), "-04:00")
      "2039-02-27T23:50:19.275038-04:00".to_datetime.should == datetime
    end

    it 'should use Rubys default start value' do
      # Taken from ActiveSupport unit tests. Not sure on the implication.
      "2039-02-27 23:50".to_datetime.start.should == ::Date::ITALY
    end

    it 'should convert empty string to nil' do
      ''.to_datetime.should be_nil
    end
  end

  describe "#to_date" do
    it 'should convert string to Date object' do
      "2005-02-27".to_date.should == Date.new(2005, 2, 27)
    end

    it 'should convert empty string to nil' do
      ''.to_date.should be_nil
    end
  end

end
