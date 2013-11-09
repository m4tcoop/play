# Recipe for play-2.1.5
 
require 'formula'
 
class Play < Formula
  homepage 'http://www.playframework.org/'
  url 'http://downloads.typesafe.com/play/2.1.5/play-2.1.5.zip'
  sha1 '0c92e9c0c0e7ddfba0ef8a2f730c5cbcd6ebc377'
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
