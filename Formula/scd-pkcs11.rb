class ScdPkcs11 < Formula
  desc "PKCS#11 provider with smart card support via GnuPG"
  homepage "https://github.com/sektioneins/scd-pkcs11"
  url "https://github.com/sektioneins/scd-pkcs11/archive/f2a9da74a338e43c3bf6885427261ecb920cc3d5.zip"
  version "0.0.1"
  sha256 "a1bd1f034dcbaf571c8c973e8e9332505a2c3e09f224742a021367a7a08cbb7f"

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
