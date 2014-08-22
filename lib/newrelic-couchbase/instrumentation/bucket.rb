::Couchbase::Bucket.class_eval do
  include NewRelic::Agent::MethodTracer

  # https://code.google.com/p/memcached/wiki/BinaryProtocolRevamped#Introduction
  [
    :get,
    :set,
    :add,
    :replace,
    :delete,
    :increment,
    :decrement,
    :flush,
    :append,
    :prepend,
    :touch,
    :stats,
    :run
  ].each do |instruction|
    add_method_tracer instruction, "ActiveRecord/Bucket/#{instruction.to_s}"
  end

  add_method_tracer :incr, "ActiveRecord/Bucket/increment"
  add_method_tracer :decr, "ActiveRecord/Bucket/decrement"

  add_method_tracer :cas,                   'ActiveRecord/Bucket/compare_and_swap'
  add_method_tracer :compare_and_swap,      'ActiveRecord/Bucket/compare_and_swap'
  add_method_tracer :design_docs,           'ActiveRecord/Bucket/design_docs'
  add_method_tracer :save_design_doc,       'ActiveRecord/Bucket/save_design_doc'
  add_method_tracer :delete_design_doc,     'ActiveRecord/Bucket/delete_design_doc'
  add_method_tracer :observe_and_wait,      'ActiveRecord/Bucket/observe_and_wait'
  add_method_tracer :create_timer,          'ActiveRecord/Bucket/create_timer'
  add_method_tracer :create_periodic_timer, 'ActiveRecord/Bucket/create_perioidic_timer'
end
