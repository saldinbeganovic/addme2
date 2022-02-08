module AccountsHelper
  def profile_picture account, width = 40, height = 40
    image_path = account.image.present? ? account.image.variant(saver: { quality: 50 }, resize_to_limit: [700, 500]).processed.service_url : "default-avatar.jpg"
    image_tag image_path, width: width, height: width, class: "thumb"
  end

  def profile_picture_post post, width = 40, height = 40
    image_path = post.account.image.present? ? post.account.image.variant(saver: { quality: 50 }, resize_to_limit: [700, 500]).processed.service_url : "default-avatar.jpg"
    image_tag image_path, width: width, height: width, class: "thumb"
  end

  def profile_picture_current current, width = 40, height = 40
    image_path = current.account.image.present? ? current.account.image.variant(saver: { quality: 50 }, resize_to_limit: [700, 500]).processed.service_url : "default-avatar.jpg"
    image_tag image_path, width: width, height: width, class: "thumb"
  end


def can_edit_profile? profile_id
  account_signed_in? && current_account.id ==profile_id
end

end
