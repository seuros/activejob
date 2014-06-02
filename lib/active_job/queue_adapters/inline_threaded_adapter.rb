module ActiveJob
  module QueueAdapters
    class InlineThreadedAdapter < InlineAdapter
      def self.enqueue(job, *args)
        Thread.new do
          job.new.execute *args
        end
      end
    end
  end
end
