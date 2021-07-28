module UserDiscussionsHelper
  def user_discussions_table_title(discussion, user, last_read)
    %Q{
      <tr></tr>
      <thead>
        <tr>
          <td class="#{last_read.nil? ? '' : 'pt-5'}" colspan="4">
            <strong>#{discussion.read_by?(user) ? t(:discussions_read) : t(:discussions_unread)}</strong>
          </td>
        </tr>
      </thead>
    }.html_safe
  end

  def user_discussions_table_header
    %Q{
      <tr>
        <td></td>
        <td><strong>#{t(:exercise)}</strong></td>
        <td><strong>#{t(:discussion_created_by)}</strong></td>
        <td><strong>#{t(:last_message)}</strong></td>
      </tr>
    }.html_safe
  end

  def user_discussions_table_item(discussion, user)
    %Q{
      <tr>
        <td class="text-center">
          #{icon_for_read(discussion.read_by?(user))}
        </td>
        <td>#{link_to discussion.item.name, item_discussion_path(discussion)}</td>
        <td>#{discussion_user_name discussion.initiator}</td>
        <td>#{time_ago_in_words discussion.last_message_date}</td>
      </tr>
    }.html_safe
  end
end
