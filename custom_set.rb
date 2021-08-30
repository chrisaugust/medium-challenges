class CustomSet
  def initialize(set=[])
    @elements = set.uniq
  end

  def add(elem)
    elements.push(elem) unless contains?(elem)
    self
  end

  def empty?
    elements.empty?
  end

  def contains?(elem)
    elements.include?(elem)
  end

  def subset?(other_set)
    elements.all? { |elem| other_set.contains? elem }
  end

  def disjoint?(other_set)
    elements.none? { |elem| other_set.contains? elem }
  end

  def eql?(other_set)
    return false unless elements.length == other_set.elements.length
    elements.all? { |elem| other_set.contains?(elem) }
  end

  def ==(other_set)
    eql?(other_set)
  end

  def intersection(other_set)
    intersecting_elements = elements.select { |e| other_set.contains? e }
    CustomSet.new(intersecting_elements)
  end

  def difference(other_set)
    differing_elements = elements.select { |elem| !other_set.contains?(elem) }
    CustomSet.new(differing_elements)
  end

  def union(other_set)
    union_set = CustomSet.new(elements)
    other_set.elements.each { |elem| union_set.add(elem) }
    union_set
  end

  protected

  attr_accessor :elements
end
