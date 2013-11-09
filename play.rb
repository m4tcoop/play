# Recipe for play-2.1.5
 
require 'formula'
 
class Play < Formula
  homepage 'http://www.playframework.org/'
  url 'http://downloads.typesafe.com/play/2.1.5/play-2.1.5.zip'
  sha1 '2fbf24bd14e4b74de7353e08fbed496baf394b04'
  version '2.1.5'
 
  def install
    rm Dir['*.bat'] # remove windows' bat files
    libexec.install Dir['*']
    inreplace libexec+"play" do |s|
      s.gsub! "$dir/", "$dir/../libexec/"
      s.gsub! "dir=`dirname $PRG`", "dir=`dirname $0` && dir=$dir/`dirname $PRG`"
    end
    bin.install_symlink libexec+'play'
  end
end
