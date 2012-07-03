# part 1
class SliceTest
  def initialize
    @a = *(1..16)
    @slices = []
  end

  def without_slice
    slice = []
    @a.each_with_index do |num, i|
      slice << num
      if (i+1) % 4 == 0
        @slices << slice
        slice = []
      end
    end
    self
  end

  def with_slice
    @a.each_slice(4) {|slice| @slices << slice}
    self
  end

  def result
    p @slices
  end
end

SliceTest.new.without_slice.result
SliceTest.new.with_slice.result

# part 2


