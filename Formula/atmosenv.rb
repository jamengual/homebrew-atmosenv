# Homebrew formula for atmosenv
# Atmos version manager inspired by tfenv

class Atmosenv < Formula
  desc "Atmos version manager inspired by tfenv"
  homepage "https://github.com/jamengual/atmosenv"
  url "https://github.com/jamengual/atmosenv/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "988f8fc2c2c7b96a24abe86a96b7de20bc39e6de44ec1d3ee3f521f4c1ce53ea"
  license "Apache-2.0"
  head "https://github.com/jamengual/atmosenv.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  conflicts_with "atmos", because: "atmosenv symlinks atmos binaries"

  def install
    prefix.install %w[bin lib libexec]
    prefix.install "share" if File.directory?("share")
  end

  def caveats
    <<~EOS
      To use atmosenv, add the following to your shell configuration:

      For bash (~/.bash_profile or ~/.bashrc):
        export PATH="#{opt_bin}:$PATH"
        eval "$(atmosenv init -)"

      For zsh (~/.zshrc):
        export PATH="#{opt_bin}:$PATH"
        eval "$(atmosenv init -)"

      For fish (~/.config/fish/config.fish):
        fish_add_path #{opt_bin}
        atmosenv init - | source

      Then restart your shell or source the config file.

      Quick start:
        atmosenv install latest    # Install latest Atmos version
        atmosenv use latest        # Switch to latest version
        atmos version              # Verify installation
    EOS
  end

  test do
    assert_match "atmosenv", shell_output("#{bin}/atmosenv --help")
    assert_match version.to_s, shell_output("#{bin}/atmosenv --version")
  end
end
