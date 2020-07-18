# This file was generated by GoReleaser. DO NOT EDIT.
class GolangciLint < Formula
  desc "Fast linters runner for Go."
  homepage "https://golangci.com"
  version "1.28.3"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/golangci/golangci-lint/releases/download/v1.28.3/golangci-lint-1.28.3-darwin-amd64.tar.gz"
    sha256 "53ee1249c500659a66a9cb258102865065464b98859bce758e6b60f483be0389"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/golangci/golangci-lint/releases/download/v1.28.3/golangci-lint-1.28.3-linux-amd64.tar.gz"
      sha256 "6f6eef6bbb1064d8170d0410d0ea9e4b9132c1c41f4596b915bd87f667982fb1"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/golangci/golangci-lint/releases/download/v1.28.3/golangci-lint-1.28.3-linux-arm64.tar.gz"
        sha256 "44bf98b677ce4bf1e874411e4f9b773ae4dad4d11d11d7a5ad62f5047b57e43f"
      else
        url "https://github.com/golangci/golangci-lint/releases/download/v1.28.3/golangci-lint-1.28.3-linux-armv6.tar.gz"
        sha256 "c75239826ae1d381d0b4953329ee6876d2993711039c03567093a676edd92000"
      end
    end
  end

  def install
    bin.install "golangci-lint"
    output = Utils.popen_read("#{bin}/golangci-lint completion bash")
    (bash_completion/"golangci-lint").write output
    output = Utils.popen_read("#{bin}/golangci-lint completion zsh")
    (zsh_completion/"_golangci-lint").write output
    prefix.install_metafiles
  end

  test do
    system "#{bin}/golangci-lint --version"
  end
end
