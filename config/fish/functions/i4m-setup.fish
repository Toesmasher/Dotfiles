function i4m-setup
  set -gx CVSROOT "niklas.berggren@sauron:/cvsroot/i4m"
  set -gx CVS_RSH "ssh"

  set -gx WORKSPACE {$HOME}/Projects/consat/i4m

  set -gx JAVA_HOME {$WORKSPACE}/net.volvo.vms.scm.util.jdks/target/linux/x86-64/jdk8/
  set -gx ANT_HOME {$WORKSPACE}/org.apache.ant/ 

  set -gx PATH {$ANT_HOME}/bin:{$PATH}

  alias ant_i386="ant -v -DapplyOnRequiredComponents=compile -Dtarget.type=ATOM -Dtarget.os.arch=i386 -Dtarget.os.version=26 -Dtarget.os.name=linux"
  alias ant_mx4="ant -v -DapplyOnRequiredComponents=compile -Dtarget.type=MX4 -Dtarget.os.arch=armv7 -Dtarget.os.version=26 -Dtarget.os.name=linux"
  alias ant_cvc="ant -v -DapplyOnRequiredComponents=compile -Dtarget.type=CVC -Dtarget.os.arch=aarch64 -Dtarget.os.version=26 -Dtarget.os.name=linux"

  set -gx PASSWORD_STORE_DIR {$HOME}/.conpass-store
end
