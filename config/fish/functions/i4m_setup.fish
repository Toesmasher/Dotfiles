function i4m_setup
  set -gx CVSROOT "niklas.berggren@vault:/cvsroot/i4m"
  set -gx CVS_RSH "ssh"

  set -gx WORKSPACE {$HOME}/Projects/consat/i4m

  set -gx JAVA_HOME {$WORKSPACE}/net.volvo.vms.scm.util.jdks/target/linux/x86-64/jdk8/
  set -gx ANT_HOME {$WORKSPACE}/org.apache.ant/ 
  set -gx GROOVY_HOME {$WORKSPACE}/org.codehaus.groovy 
  set -gx ASX_TOOL_DIR {$WORKSPACE}/net.volvo.vms.scm.util 
  set -gx QT_HOME {$WORKSPACE}/com.trolltech.qt
  set -gx OMNI_HOME {$WORKSPACE}/net.sf.omniorb

  set -gx PATH {$ANT_HOME}/bin:{$GROOVY_HOME}/bin:{$HOME}/bin:{$ASX_TOOL_DIR}/bin:{$QT_HOME}/target/linux/i386/bin:{$PATH}
  set -gx LD_LIBRARY_PATH {$QT_HOME}/target/linux/i386/lib/:{$OMNI_HOME}/target/linux/i386/lib:$LD_LIBRARY_PATH 

  alias ant="ant -DapplyOnRequiredComponents=compile"
end
