# -*- mode: snippet -*-
# name: interface
# key: interface
# --
public interface ${1:`(file-name-sans-extension (buffer-name))`}$2 {
    $0
}