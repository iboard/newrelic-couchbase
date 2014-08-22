::Couchbase::View.class_eval do
  include NewRelic::Agent::MethodTracer

  [
    :each,
    :first,
    :take,
    :on_error,
    :fetch,
    :fetch_all
  ].each do |instruction|
    add_method_tracer instruction, "ActiveRecord/View/#{instruction.to_s}"
  end
end
