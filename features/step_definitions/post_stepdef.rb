Then(/^the post button is "(.*?)" from the post composer$/) do |status|
  case status
  when 'disabled'
    if on(PostComposerScreen).check_post_btn_enabled
      raise('Done button enabled')
    end
  when 'enabled'
    unless on(PostComposerScreen).check_post_btn_enabled
      raise('Done button disabled')
    end
  end
end

And(/^I enter a post with "(.*?)" characters$/) do |count|
  step 'the "Find Out Who You Know on B/R" social promo is "shown"'
  num = count.to_i
  rand_word = ReusableFunction.generate_random_string(num)

  on(PostComposerScreen).set_composer_entry_txtfield(rand_word)
end

Then(/^I tap on GIF button$/) do
  step 'the "Find Out Who You Know on B/R" social promo is "shown"'
  on(PostComposerScreen).tap_gif_btn
end

Then(/^I tap on media button$/) do
  on(PostComposerScreen).tap_media_btn
end

And(/^I enter "(.*?)" post$/) do |post_type|
  step 'the post button is "disabled" from the post composer'
  step 'the "Find Out Who You Know on B/R" social promo is "shown"'
  case post_type
  when 'text'
    @post = ReusableFunction.generate_user_post
    on(PostComposerScreen).set_composer_entry_txtfield(@post)
  when 'GIF'
    step 'I tap on GIF button'
    step 'I tap on a GIF image'
  when 'GIF and text'
    # add text
    @post = ReusableFunction.generate_user_post
    on(PostComposerScreen).set_composer_entry_txtfield(@post)
    # add GIF
    step 'I tap on GIF button'
    step 'I tap on a GIF image'
  when 'image'
    step 'I tap on media button'
    on(GlobalScreenElements).tap_allow_permission
    images = find_elements(:id, 'com.bleacherreport.android.teamstream:id/mediaImage')
    images[1].click
    images[2].click
    on(GlobalScreenElements).tap_textview('Next')
  end
  step 'the post button is "enabled" from the post composer'
end

And(/^I tap cancel on post composer entry$/) do
  on(PostComposerScreen).tap_post_cancel_btn
end

And(/^the GIF button is displayed$/) do
  on(PostComposerScreen).verify_gif_btn_exists
end

And(/^the media button is displayed$/) do
  on(PostComposerScreen).verify_media_btn_exists
end

And(/^GIF is (.*?)$/) do |action|
  begin
    media_exists = find_element(:id, 'com.bleacherreport.android.teamstream:id/exo_subtitles').displayed?
  rescue StandardError
    media_exists = false
  end

  case action
  when 'added'
    raise('GIF not added') if media_exists == false
  when 'removed'
    raise 'GIF not removed' unless media_exists == false
  end
end

Then(/^I tap on close "(.*?)"$/) do |mediatype|
  case mediatype
  when 'GIF'
    on(PostComposerScreen).tap_close_gif
  when 'image'
    on(PostComposerScreen).tap_close_image
  end
end

And(/^I enter a search term with (.*?)$/) do |option|
  case option
  when 'results'
    @search_term = TestData.use_data('search_options', 'gif_results')
  when 'no results'
    @search_term = TestData.use_data('search_options', 'gif_no_results')
  end
  on(PostComposerScreen).set_gif_search_txtfield(@search_term)
end

And(/^I navigate back to the composer$/) do
  on(PostComposerScreen).tap_up_btn
end