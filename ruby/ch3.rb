class CsvRow
  def initialize(headers, row)
    @headers = headers
    @row = row
  end

  def method_missing(method, *args, &block)
    index = @headers.index(method.to_s)
    raise "No column with that name" unless index
    @row[index]
  end
end

module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(File.join(File.dirname(__FILE__),filename))
      @headers = file.gets.chomp.split(', ')
      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    def each(&block)
      @csv_contents.each do |row|
        csv_row = CsvRow.new(@headers, row)
        yield csv_row
      end
    end

    attr_accessor :headers, :csv_contents

    def initialize
      read
    end
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

csv = RubyCsv.new

csv.each do |row|
  puts row.one
  puts row.two
  puts row.three
end

