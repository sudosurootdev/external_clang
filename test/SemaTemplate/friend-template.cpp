// RUN: clang-cc -fsyntax-only -verify %s

// PR5057
namespace std {
  class X {
  public:
    template<typename T>
    friend struct Y;
  };
}

namespace std {
  template<typename T>
  struct Y
  {
  };
}


namespace N {
  template<typename T> void f1(T) { } // expected-note{{here}}

  class X {
    template<typename T> friend void f0(T);
    template<typename T> friend void f1(T);
  };

  template<typename T> void f0(T) { }
  template<typename T> void f1(T) { } // expected-error{{redefinition}}
}
