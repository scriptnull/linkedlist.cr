require "./bench_helper.cr"

sll = Linkedlist::Singly(Int32).new
dll = Linkedlist::Doubly(Int32).new

Benchmark.ips do |x|
  x.report("Singly#insert_tail") do
    sll.insert_tail(1)
  end

  x.report("Doubly#insert_tail") do
    dll.insert_tail(1)
  end
end
