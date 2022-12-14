if @note.persisted?
  json.inserted_item render(partial: "notes/note", formats: :html, locals: {note: @note})
  json.form render(partial: "notes/form", formats: :html)
else
  json.form render(partial: "notes/form", formats: :html, locals: {notes: policy_scope(Note).sort_by { |n| n.created_at  }.last(3).reverse })
end
