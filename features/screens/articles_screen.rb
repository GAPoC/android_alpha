require_all 'features/support/object_repository.rb'
require_all 'features/support/accessors.rb'

# Class to define Articles Screen
# element functionalities
class ArticleScreen
  include Accessors
  extend ObjectRepo

  # TEXT Element
  Accessors.text(:commentary_title, ObjectRepo::COMMENTARY_TITLE)
  def verify_commentary_title_exist
    commentary_title?
  end

  def get_commentary_title_text
    commentary_title_text
  end

  def verify_commentary_title_text(text)
    raise("Unable to locate #{text}") unless get_commentary_title_text == text
  end

  def tap_commentary_title
    commentary_title
  end

  Accessors.text(:stream_name, ObjectRepo::STREAM_NAME)
  def verify_stream_name_exist
    ReusableFunction.wait_for(15, 'Commentary Title') { stream_name? }
  end

  def get_stream_name
    stream_name_text
  end

  def verify_my_teams_only_stream_title
    stream = ['Kicks',
              'The Climb',
              'UNINTERRUPTED',
              'Featured',
              'Sports Odds',
              'Daily Fantasy',
              'World Football',
              'UEFA Champions League',
              'Ajax',
              'UK National',
              'Golden State Warriors',
              'dodgeball',
              'UK Featured']
    unless stream.include? get_stream_name
      raise("Unable to locate #{get_stream_name} title")
    end
  end

  def tap_stream_name
    stream_name
  end

  Accessors.text(:user_reaction_counts, ObjectRepo::USER_REACTION_COUNTS)
  def tap_user_reaction_counts
    user_reaction_counts
  end

  def user_reaction_counts_exists
    user_reaction_counts?
  end

  Accessors.text(:tweet_username, ObjectRepo::TWEET_USERNAME)
  def verify_exists_tweet_username
    ReusableFunction.wait_for(20, 'Tweet Username') { tweet_username? }
  end

  # BUTTON Element
  Accessors.button(:bookmark_btn, ObjectRepo::BOOKMARK_BTN)
  def tap_bookmark_btn
    bookmark_btn
  end

  Accessors.button(:reaction_btn, ObjectRepo::REACTION_BTN)
  def tap_reaction_btn
    reaction_btn
  end

  def verify_reaction_btn_exist
    reaction_btn?
  end

  Accessors.button(:share_btn, ObjectRepo::SHARE_BTN)
  def tap_share_btn
    share_btn
  end

  def verify_share_btn_exist
    share_btn?
  end

  Accessors.button(:share_dm_btn, ObjectRepo::SHARE_DM_BTN)
  def tap_share_dm_btn
    share_dm_btn
  end

  def verify_share_dm_btn_exist
    share_dm_btn?
  end

  Accessors.button(:share_dm_close, ObjectRepo::SHARE_DM_CLOSE)
  def tap_share_dm_close
    share_dm_close
  end

  Accessors.button(:conversation_btn, ObjectRepo::CONVERSATION_BTN)
  def verify_conversation_btn
    conversation_btn?
  end

  def tap_conversation_btn
    conversation_btn
  end

  # IMAGE Element
  Accessors.image(:article_logo_img, ObjectRepo::STREAM_LOGO_IMG)
  def verify_stream_name
    stream_name
  end
end