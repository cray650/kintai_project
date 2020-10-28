# README

# Name

勤怠管理システム「KINTAI」

# 概要

Ruby on Railsを使用した、勤怠管理システムです。社員の勤怠時間の管理をすることができます。

# URL

# 一般用アカウント
メールアドレス : sample@sample.com  
パスワード    : 1111aa

# 利用方法
ログイン後、出勤、退勤ボタンを押すことで、出勤時間と退勤時間を確認することができます。

# 目指した課題解決
営業職では















#テーブル設計

## users テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| employee_id | string | null: false |
| firstname   | string | null: false |
| lastname    | string | null: false |
| email       | string | null: false |
| password    | string | null: false |

### Association

- has_many  :time_cards

## time_cards テーブル

| Column | Type     | Options     |
| ------ | -------- | ----------- |
| year   | integer  | null: false |
| month  | integer  | null: false |
| day    | integer  | null: false |
| in     | datetime |             |
| out    | datetime |             |

### Association

- belongs_to :user




