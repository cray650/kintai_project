class Type < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '早退' },
    { id: 3, name: '遅刻' },
    { id: 4, name: '有給休暇' },
    { id: 5, name: '打刻漏れ' }
  ]
end
