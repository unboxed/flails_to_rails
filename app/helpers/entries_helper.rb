module EntriesHelper
  def comments_link_for_entry(entry)
    link_to pluralize(entry.comments.count, "comment"), entry_comments_path(entry)
  end
end
