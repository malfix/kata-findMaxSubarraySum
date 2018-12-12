class Exercise
  def find(*circular_list)
    local_min, total, circular_list = get_localmin_total_and_compressed_list(*circular_list)
    local_min = [0, local_min, sum_boundary(circular_list)].min
    total - local_min
  end

  def get_localmin_total_and_compressed_list(*circular_list)
    local_min, total = [circular_list[0], circular_list[0]]
    idx = 0 + 1
    while idx < circular_list.size
      total += circular_list[idx]
      if (have_same_sign(circular_list, idx))
        circular_list[idx - 1] = circular_list[idx - 1] + circular_list.delete_at(idx)
        local_min = [local_min, circular_list[idx - 1]].min
      else
        local_min = [local_min, circular_list[idx]].min
        idx += 1
      end
    end
    [local_min, total, circular_list]
  end

  def have_same_sign(circular_list, idx)
    circular_list[idx - 1] * circular_list[idx] > 0
  end

  def sum_boundary(circular_list)
    circular_list[-1] + circular_list[0]
  end
end
