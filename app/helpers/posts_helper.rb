module PostsHelper

def post_liked_by_user? post_id
  Like.where(post_id: post_id, account_id: current_account.id).any?
end
def limitComments
  if active_for(path: "/dashboard")
    2
  else

  end

end
def orderBy
  if active_for(path: "/dashboard")
    "RANDOM()"
  else

  end

end

def showAgo

  if active_for(path: "/dashboard")
    
  else

  end

end

end
