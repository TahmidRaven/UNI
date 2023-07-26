def find_max_possible_race_members(num_fights, rivals):
    race_members = set()
    for u, v in rivals:
        race_members.add(u)
        race_members.add(v)
    return len(race_members)

def Sol():
    input_file_path = "C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB04\\Task08_input01.txt"
    output_file_path = "C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB04\\Task08_output01.txt"

    with open(input_file_path, 'r') as f01, open(output_file_path, 'w') as f02:
        T = int(f01.readline().strip())

        for case_number in range(1, T + 1):
            num_fights = int(f01.readline().strip())
            rivals = [tuple(map(int, f01.readline().strip().split())) for i in range(num_fights)]

            max_race_members = find_max_possible_race_members(num_fights, rivals)

            f02.write(f"Case {case_number}: {max_race_members}\n")
            
Sol()
