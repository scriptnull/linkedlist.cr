require "./bench_helper.cr"

sll = Linkedlist::Singly(Int32).new
dll = Linkedlist::Doubly(Int32).new

Benchmark.ips do |x|
  x.report("Singly#insert_head") do
    sll.insert_head(1)
  end

  x.report("Doubly#insert_head") do
    dll.insert_head(1)
  end
end
