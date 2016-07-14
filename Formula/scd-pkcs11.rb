class ScdPkcs11 < Formula
  desc "PKCS#11 provider with smart card support via GnuPG"
  homepage "https://github.com/sektioneins/scd-pkcs11"
  url "https://github.com/sektioneins/scd-pkcs11/archive/500c01cc0a84ecc70ed53fc54783babfdf3428ab.tar.gz"
  version "0.0"
  sha256 "7b888a881eb3ff8711254a5b67fd218fda19fc077da44a9933bc8f8c9eb149e7"

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
