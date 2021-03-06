#!/usr/bin/env bash
set -e
source setEnv.sh
source cleanUp.sh

maybeCleanUp

export llvmsvn=http://llvm.org/svn/llvm-project/llvm/trunk
export clangsvn=http://llvm.org/svn/llvm-project/cfe/trunk
export ctesvn=http://llvm.org/svn/llvm-project/clang-tools-extra/trunk
export lldbsvn=http://llvm.org/svn/llvm-project/lldb/trunk
export lldsvn=http://llvm.org/svn/llvm-project/lld/trunk
export pollysvn=http://llvm.org/svn/llvm-project/polly/trunk
export testsuitesvn=http://llvm.org/svn/llvm-project/test-suite/trunk
export openmpsvn=http://llvm.org/svn/llvm-project/openmp/trunk
export libunwindsvn=http://llvm.org/svn/llvm-project/libunwind/trunk
export libcxxabisvn=http://llvm.org/svn/llvm-project/libcxxabi/trunk
export libcxxsvn=http://llvm.org/svn/llvm-project/libcxx/trunk

if [ "$1" == "" ]; then
    export rev=HEAD
else
    export rev=$1
fi

function svnFunc {
  if [ -d "$1/.svn" ]; then
      svn cleanup $1
      svn update --non-interactive --no-auth-cache --revision $rev $1
  else
      svn checkout --non-interactive --no-auth-cache --revision $rev $2@$rev $1
  fi
}

svnFunc $llvmDir $llvmsvn
svnFunc $clangDir $clangsvn
svnFunc $cteDir $ctesvn
svnFunc $lldbDir $lldbsvn
svnFunc $lldDir $lldsvn
svnFunc $pollyDir $pollysvn
svnFunc $testsuiteDir $testsuitesvn
svnFunc $openmpDir $openmpsvn
svnFunc $libunwindDir $libunwindsvn
svnFunc $libcxxabiDir $libcxxabisvn
svnFunc $libcxxDir $libcxxsvn
