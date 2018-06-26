class ScdPkcs11 < Formula
  desc "PKCS#11 provider with smart card support via GnuPG"
  homepage "https://github.com/sektioneins/scd-pkcs11"
  url "https://github.com/sektioneins/scd-pkcs11/archive/65854dccaa51955f51b00fc0e9ce20ed08a4ce78.zip"
  version "0.0.2"
  sha256 "57ebc66b9f1f62e97877e62a166ea7989a3c473f86a95d929b698ec32bfd3129"

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
