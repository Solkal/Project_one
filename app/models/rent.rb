class Rent < ActiveRecord::Base
  belongs_to :user
  belongs_to :auto
  # validates: :client_id, :car_id, presence: true
  # validates: :date_start, :date_end, presence: true
  # daty będą rozwijane z listy (pole date cośtam) więc ta druga walidacja później nie będzie potrebna
  # id dla obu modeli będą wpisywane klient: nazwisko i numer rejetracyjny samochodu
end
