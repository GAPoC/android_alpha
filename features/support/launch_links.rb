# Class for android launchlinks
class LaunchLinks

  # Enables dodgeball stream
  def self.launch_dodgeball_stream
    locale = %w[en_GB en_AU nl_BE]

    unless locale.include? ENV['LOCALE'].to_s
      execute_script('mobile: deepLink', {'url' => 'teamstream://dodgeballon',
                                          'package' => 'com.bleacherreport.android.teamstream'})
    end
  end
end