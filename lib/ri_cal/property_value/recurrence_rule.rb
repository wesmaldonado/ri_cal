Dir[File.dirname(__FILE__) + "/recurrence_rule/*.rb"].sort.each do |path|
  require path
end

module RiCal
  class PropertyValue
    #- ©2009 Rick DeNatale
    #- All rights reserved. Refer to the file README.txt for the license
    #
    # RiCal::PropertyValue::RecurrenceRule represents an icalendar Recurrence Rule property value
    # which is defined in 
    # rfc 2445 section 4.3.10 pp 40-45
    class RecurrenceRule < PropertyValue
      
      def initialize(parent, value_hash) # :nodoc:
        @by_list_hash = {}
        super
        init_by_lists
        @by_list_hash = nil
      end
      
      def self.convert(parent, value) #:nodoc:
        if String === value
          result = new(parent, :value => value)
        else
          result = new(parent, value)
        end
        result
      end
      
      include Validations
      include InitializationMethods
      include EnumerationSupportMethods

      # The integer count value of the receiver, or nil
      attr_reader :count
      # The DATE-TIME value of until limit of the receiver, or nil
      attr_reader :until

      def value=(string) # :nodoc:
        if string
          @value = string
          dup_hash = {}
          string.split(";").each do |value_part|
            initialize_from_value_part(value_part, dup_hash)
          end
        end
      end

      # Set the frequency of the recurrence rule
      # freq_value:: a String which should be in %w[SECONDLY MINUTELY HOURLY DAILY WEEKLY MONTHLY YEARLY]
      # 
      # This method resets the receivers list of errors
      def freq=(freq_value)
        reset_errors
        @freq = freq_value
      end

      # return the frequency of the rule which will be a string 
      def freq
        @freq.upcase
      end

      # return the starting week day for the recurrence rule, which for a valid instance will be one of
      # "SU", "MO", "TU", "WE", "TH", "FR", or "SA"
      def wkst
        @wkst || 'MO'
      end

      def wkst_day # :nodoc:
        @wkst_day ||= (%w{SU MO TU WE FR SA}.index(wkst) || 1)
      end

      # Set the starting week day for the recurrence rule, which should  be one of
      # "SU", "MO", "TU", "WE", "TH", "FR", or "SA" for the instance to be valid.
      # The parameter is however case-insensitive.
      # 
      # This method resets the receivers list of errors
      def wkst=(value)
        reset_errors
        @wkst = value
        @wkst_day = nil
      end

      # Set the count parameter of the recurrence rule, the count value will be converted to an integer using to_i
      # 
      # This method resets the receivers list of errors
      
      def count=(count_value)
        reset_errors
        @count = count_value
        @until = nil unless @count.nil? || @by_list_hash
      end

      # Set the until parameter of the recurrence rule
      #
      # until_value:: the value to be set, this may be either a string in RFC 2446 Date or DateTime value format
      # Or a Date, Time, DateTime, RiCal::PropertyValue::Date, or RiCal::PropertyValue::DateTime
      #
      def until=(until_value)
        reset_errors
        @until = until_value && until_value.to_ri_cal_date_or_date_time_value
        @count = nil unless @count.nil? || @by_list_hash
      end

      # return the INTERVAL parameter of the recurrence rule
      # This returns an Integer
      def interval
        @interval ||= 1
      end

      # Set the INTERVAL parameter of the recurrence rule
      #
      # interval_value:: an Integer
      #
      # This method resets the receivers list of errors
      def interval=(interval_value)
        reset_errors
        @interval = interval_value
      end
      
      def value
        @value || to_ical
      end      

      # Return a string containing the RFC 2445 representation of the recurrence rule
      def to_ical
        result = ["FREQ=#{freq}"]
        result << "INTERVAL=#{interval}" unless interval == 1
        result << "COUNT=#{count}" if count
        result << "UNTIL=#{self.until.value}" if self.until
        %w{bysecond byminute byhour byday bymonthday byyearday byweekno bymonth bysetpos}.each do |by_part|
          val = by_list[by_part.to_sym]
          result << "#{by_part.upcase}=#{[val].flatten.join(',')}" if val
        end
        result << "WKST=#{wkst}" unless wkst == "MO"
        result.join(";")
      end
      
      # Predicate to determine if the receiver generates a bounded or infinite set of occurrences
      def bounded?
        @count || @until
      end
    end
  end
end