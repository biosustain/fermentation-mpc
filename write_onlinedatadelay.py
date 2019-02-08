from time import sleep


with open("data/test.csv") as f:
    test_lines = f.readlines()
    print(len(test_lines))

    for i in range(len(test_lines)):
        with open("data/out.csv", "a") as f1:
            f1.write(test_lines[i])
            print(test_lines[i])
            sleep(5)
            f1.close()



