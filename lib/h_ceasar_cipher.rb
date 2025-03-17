# frozen_string_literal: true

require_relative "h_ceasar_cipher/version"

# シーザー暗号モジュール
module HCeasarCipher
  class Error < StandardError; end

  # 暗号化
  # 引数として、平文とシフト数を受け取り、暗号文を返す
  # @param [String] plain_text 平文
  # @param [Integer] shift シフト数
  # @return [String] 暗号文
  def self.encrypt(plain_text, shift)
    plain_text.chars.map do |char|
      if char.match?(/[a-z]/)
        ((char.ord - 97 + shift) % 26 + 97).chr
      elsif char.match?(/[A-Z]/)
        ((char.ord - 65 + shift) % 26 + 65).chr
      else
        char
      end
    end.join
  end

  # 復号化
  # 引数として、暗号文とシフト数を受け取り、平文を返す
  # @param [String] cipher_text 暗号文
  # @param [Integer] shift シフト数
  # @return [String] 平文
  def self.decrypt(cipher_text, shift)
    encrypt(cipher_text, -shift)
  end

  # # シフト数を推測
  # # 引数として、暗号文を受け取り、シフト数を推測する
  # # @param [String] cipher_text 暗号文
  # # @return [Integer] シフト数
  # def self.guess_shift(cipher_text)
  #   ('a'..'z').max_by do |char|
  #     decrypt(cipher_text, char.ord - 'a'.ord).scan(/[a-zA-Z]/).size
  #   end.ord - 'a'.ord
  # end

  # バリデーション
  # 引数がアルファベットのみかどうかを判定する
  # @param [String] text 文字列
  # @return [Boolean] アルファベットのみかどうか
  def self.alphabet_only?(text)
    text.match?(/\A[a-zA-Z]+\z/)
  end
end
