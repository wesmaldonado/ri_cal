module RiCal
  # A TimezonePeriod is a component of a timezone representing a period during which a particular offset from UTC is
  # in effect.
  class TimezonePeriod < Component
    # BEGIN GENERATED ATTRIBUTE CODE

    # return the the DTSTART property
    # which will be an instances of either RiCal::DateTimeValue or RiCall::DateValue
    # 
    # [purpose (from RFC 2445)]
    # This property specifies when the calendar component begins.
    # 
    # see RFC 2445 4.8.2.4 pp 93-94
    def dtstart_property
      @dtstart_property
    end

    # set the DTSTART property
    # property value should be an instance of either RiCal::DateTimeValue or RiCall::DateValue
    def dtstart_property=(property_value)
      @dtstart_property = property_value
    end

    # set the value of the DTSTART property
    def dtstart=(ruby_value)
      self.dtstart_property= DateTimeValue.convert(ruby_value)
    end

    # return the value of the DTSTART property
    # which will be an instance of either DateTime or Date
    def dtstart
      value_of_property(dtstart_property)
    end

    def dtstart_property_from_string(line) # :nodoc:
      @dtstart_property = DateTimeValue.from_separated_line(line)
    end


    # return the the TZOFFSETTO property
    # which will be an instances of RiCal::UtcOffsetValue
    # 
    # [purpose (from RFC 2445)]
    # This property specifies the offset which is in use in this time zone observance
    # 
    # see RFC 2445 4.8.3.4 pp 100-101
    def tzoffsetto_property
      @tzoffsetto_property
    end

    # set the TZOFFSETTO property
    # property value should be an instance of RiCal::UtcOffsetValue
    def tzoffsetto_property=(property_value)
      @tzoffsetto_property = property_value
    end

    # set the value of the TZOFFSETTO property
    def tzoffsetto=(ruby_value)
      self.tzoffsetto_property= UtcOffsetValue.convert(ruby_value)
    end

    # return the value of the TZOFFSETTO property
    # which will be an instance of UtcOffset
    def tzoffsetto
      value_of_property(tzoffsetto_property)
    end

    def tzoffsetto_property_from_string(line) # :nodoc:
      @tzoffsetto_property = UtcOffsetValue.new(line)
    end


    # return the the TZOFFSETFROM property
    # which will be an instances of RiCal::UtcOffsetValue
    # 
    # [purpose (from RFC 2445)]
    # This property specifies the offset which is in use prior to this time zone observance
    # 
    # see RFC 2445 4.8.3.3 pp 99-100
    def tzoffsetfrom_property
      @tzoffsetfrom_property
    end

    # set the TZOFFSETFROM property
    # property value should be an instance of RiCal::UtcOffsetValue
    def tzoffsetfrom_property=(property_value)
      @tzoffsetfrom_property = property_value
    end

    # set the value of the TZOFFSETFROM property
    def tzoffsetfrom=(ruby_value)
      self.tzoffsetfrom_property= UtcOffsetValue.convert(ruby_value)
    end

    # return the value of the TZOFFSETFROM property
    # which will be an instance of UtcOffset
    def tzoffsetfrom
      value_of_property(tzoffsetfrom_property)
    end

    def tzoffsetfrom_property_from_string(line) # :nodoc:
      @tzoffsetfrom_property = UtcOffsetValue.new(line)
    end


    # return the the COMMENT property
    # which will be an array of instances of RiCal::TextValue
    # 
    # [purpose (from RFC 2445)]
    # This property specifies non-processing information intended to provide a comment to the calendar user.
    # 
    # see RFC 2445 4.8.1.4 pp 80-81
    def comment_property
      @comment_property ||= []
    end

    # set the the COMMENT property
    # one or more instances of RiCal::TextValue may be passed to this method
    def comment_property=(*property_values)
      comment_property= property_values
    end

    # set the value of the COMMENT property
    # one or more instances of String may be passed to this method
    def comment=(*ruby_values)
      @comment_property = ruby_values.map {|val| TextValue.convert(val)}
    end

    # return the value of the COMMENT property
    # which will be an array of instances of String
    def comment
      comment_property.map {|prop| value_of_property(prop)}
    end

    def comment_property_from_string(line) # :nodoc:
      comment_property << TextValue.new(line)
    end

    # return the the RDATE property
    # which will be an array of instances of RiCal::DateListValue
    # 
    # [purpose (from RFC 2445)]
    # This property defines the list of date/times for a recurring calendar component.
    # 
    # see RFC 2445 4.8.5.3 pp 115-117
    def rdate_property
      @rdate_property ||= []
    end

    # set the the RDATE property
    # one or more instances of RiCal::DateListValue may be passed to this method
    def rdate_property=(*property_values)
      rdate_property= property_values
    end

    # set the value of the RDATE property
    # one or more instances of DateList may be passed to this method
    def rdate=(*ruby_values)
      @rdate_property = ruby_values.map {|val| DateListValue.convert(val)}
    end

    # return the value of the RDATE property
    # which will be an array of instances of DateList
    def rdate
      rdate_property.map {|prop| value_of_property(prop)}
    end

    def rdate_property_from_string(line) # :nodoc:
      rdate_property << DateListValue.new(line)
    end

    # return the the RRULE property
    # which will be an array of instances of RiCal::RecurrenceRuleValue
    # 
    # [purpose (from RFC 2445)]
    # This property defines a rule or repeating pattern for recurring events, to-dos, or time zone definitions.
    # 
    # see RFC 2445 4.8.5.4 pp 117-125
    def rrule_property
      @rrule_property ||= []
    end

    # set the the RRULE property
    # one or more instances of RiCal::RecurrenceRuleValue may be passed to this method
    def rrule_property=(*property_values)
      rrule_property= property_values
    end

    # set the value of the RRULE property
    # one or more instances of RecurrenceRule may be passed to this method
    def rrule=(*ruby_values)
      @rrule_property = ruby_values.map {|val| RecurrenceRuleValue.convert(val)}
    end

    # return the value of the RRULE property
    # which will be an array of instances of RecurrenceRule
    def rrule
      rrule_property.map {|prop| value_of_property(prop)}
    end

    def rrule_property_from_string(line) # :nodoc:
      rrule_property << RecurrenceRuleValue.new(line)
    end

    # return the the TZNAME property
    # which will be an array of instances of RiCal::TextValue
    # 
    # [purpose (from RFC 2445)]
    # This property specifies the customary designation for a time zone description.
    # 
    # see RFC 2445 4.8.3.2 p 99
    def tzname_property
      @tzname_property ||= []
    end

    # set the the TZNAME property
    # one or more instances of RiCal::TextValue may be passed to this method
    def tzname_property=(*property_values)
      tzname_property= property_values
    end

    # set the value of the TZNAME property
    # one or more instances of String may be passed to this method
    def tzname=(*ruby_values)
      @tzname_property = ruby_values.map {|val| TextValue.convert(val)}
    end

    # return the value of the TZNAME property
    # which will be an array of instances of String
    def tzname
      tzname_property.map {|prop| value_of_property(prop)}
    end

    def tzname_property_from_string(line) # :nodoc:
      tzname_property << TextValue.new(line)
    end

    def self.property_parser
      {"RDATE"=>:rdate_property_from_string, "DTSTART"=>:dtstart_property_from_string, "TZNAME"=>:tzname_property_from_string, "RRULE"=>:rrule_property_from_string, "TZOFFSETFROM"=>:tzoffsetfrom_property_from_string, "COMMENT"=>:comment_property_from_string, "TZOFFSETTO"=>:tzoffsetto_property_from_string}
    end

    def mutual_exclusion_violation
      false
    end
    # END GENERATED ATTRIBUTE CODE

  end
end