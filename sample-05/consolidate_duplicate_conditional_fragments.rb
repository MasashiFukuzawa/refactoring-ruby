# Before
if special_deal?
  total = price * 0.95
  send_order
else
  total = price * 0.98
  send_order
end

# After
if special_deal?
  total = price * 0.95
else
  total = price * 0.98
end
send_order
