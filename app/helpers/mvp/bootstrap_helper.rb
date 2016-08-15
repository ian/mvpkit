module MinimumViableProduct
  module BootstrapHelper
    def col_groups_of(count, collection, opts={})
      return if collection.blank?

      html = []
      collection.in_groups_of(count).each do |groups|
        groups.compact.each do |obj|
          html << capture do
            content_tag :div, class: ["col-md-#{12/count.to_f.floor}", opts[:col_class]].compact.join(' ') do
              yield obj
            end
          end.html_safe
        end
      end
      concat html.join.html_safe
    end

    def row_groups_of(count, collection, opts={}, &block)
      return if collection.blank?

      html = []
      subsetsize = (collection.count/count.to_f)
      subsetsize.ceil.times do |i|
        subset = collection[count*i...((count*i)+count)]
        html << capture do
          content_tag :div, class: ["row",opts[:row_class]].compact.join(' ') do
            capture do
              col_groups_of(count, subset, opts, &block)
            end
          end
        end.html_safe
      end

      concat html.join.html_safe
    end
  end
end
