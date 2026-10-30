from typing import Any, Union
from os import PathLike
from pathlib import Path
import os
import time

def main() -> None:
    # TODO: Make sure to add some logic and prints so teacher's can see the results

    normal_path = Path.cwd()
    tmpfs_path = '/mnt/mytmpfs' 

    normal_result = benchmark(normal_path)
    print(f"Temps en disc: {normal_result:.4f} segons")
    tmpfs_result = benchmark(tmpfs_path)
    print(f"Temps en tmpfs: {tmpfs_result:.4f} segons")
    relation = relation_aspect(normal_result, tmpfs_result)
    print(f"El tmpfs és aproximadament {relation:.2f} x més ràpid")


def benchmark(path: Union[str, PathLike]) -> float:  
    file_path = Path(path) / "testfile"
    size_mb = 500

    start_time = time.time()
    with open(file_path, 'wb') as f:
        f.write(os.urandom(size_mb * 1024 * 1024)) 
    end_time = time.time()
    os.remove(file_path)
    return end_time - start_time

def relation_aspect(normal_result: Any, tmpfs_result: Any) -> float:  # Change parameter types as needed
    return normal_result / tmpfs_result

if __name__ == '__main__':
    main()