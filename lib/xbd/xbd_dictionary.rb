module Xbd
  #*********************************
  # Xbd::Dictionary
  #*********************************
  # Consists of:
  #   @hash:  a map from values to IDs and IDs to values
  #   @array: a list of values; their indexes == their IDs
  #
  class Dictionary
    attr_reader :hash,:array

    def initialize(initial_values=[])
      @hash={}
      @array=[]
      initial_values.each {|v| add v, false}
    end

    def length; @array.length end

    # return String given an ID, or ID given a String
    def [](i) @hash[i] end

    def Dictionary.sanitize_string(str)
      case str
      when String then  "#{str}".force_encoding("BINARY")
      else              str.to_s.force_encoding("BINARY")
      end
    end

    # add a String to the dictionary
    def <<(str) add str end

    # convert to binary string
    def to_binary
      [@array.length.to_asi, @array.collect{|v| v.length.to_asi}, @array].join.to_asi_string
    end

    def Dictionary.parse(source,index=0)
      encoded_dictionary, index = source.read_asi_string index
      encoded_dictionary = StringIO.new(encoded_dictionary)
      num_entries = encoded_dictionary.read_asi
      lengths = num_entries.times.collect {encoded_dictionary.read_asi}
      strings = lengths.collect {|len| encoded_dictionary.read len}
      [Dictionary.new(strings), index]
    end

    private
    # enforce_unique == false during loading, since technically, and xbd dictionary COULD have duplicate entries.
    # Duplicate entries only reduces efficiency. It shouldn't break anything.
    # XBD files shouldn't have dupes, but the current C++ implementation DOES create them rarely (bug).
    def add(str, enforce_unique = true)
      str = Dictionary.sanitize_string str
      return @hash[str] if @hash[str] && enforce_unique

      @hash[str] = new_id = @array.length
      @array << @hash[new_id] = str
    end

  end
end
