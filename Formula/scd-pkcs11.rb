class ScdPkcs11 < Formula
  desc "PKCS#11 provider with smart card support via GnuPG"
  homepage "https://github.com/sektioneins/scd-pkcs11"
  url "https://github.com/sektioneins/scd-pkcs11/archive/9c7ecd3c8ba2abb9940d883ac965c3fda8574098.zip"
  version "0.0.3"
  sha256 "935f39c2b94de30c6470b9e077139c6740a722fe76da24b4f16ad3e329c3bdb6"

  depends_on "libressl"
  depends_on "libassuan"
  depends_on "libgcrypt"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "./configure", "--prefix=#{prefix}", "--with-ssl=/usr/local/opt/libressl"
    system "make", "-j2"
    system "echo", "#{prefix}"
    system "make", "install"
  end

  test do
    system "false"
  end
end
