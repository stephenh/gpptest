
require 'buildr/ivy_extension'
require 'buildr/groovy/compiler'

THIS_VERSION = ENV['version'] || 'SNAPSHOT'
Java.java.lang.System.setProperty("version", THIS_VERSION)

# just for buildr to bootstrap, then everything else is ivy
repositories.remote << 'http://repo1.maven.org/maven2'

# repositories.release_to = 'sftp://joist.ws/var/joist.repo'
# repositories.release_to[:permissions] = 0644

artifact_ns(Buildr::Groovy::Groovyc).groovy = '1.7.6'

define 'gpptest' do
  project.group = 'gpptest'
  project.version = THIS_VERSION
  project.package_with_sources
  package(:jar).pom.tap do |pom|
    pom.enhance [task('ivy:makepom')]
    pom.from 'target/pom.xml'
  end
  ivy.compile_conf(['default', 'provided']).test_conf('test')
end




