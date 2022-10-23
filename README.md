Generate Kali Chroot
---

Install needs:

```
$ sudo apt install debootstrap gpg
```

First use gen.sh script:

```
$ bin/gen.sh <size as GB>
```

Generated current.txt and KLM image.


After run root.sh

```
$ bin/root.sh
```

Enter chroot and work with kali. CTRL+C and exit with write changes.

If you need encrypt image;

```
$ bin/enc.sh
```

If you need decrypt image;

```
$ bin/dec.sh
```

If you need house clean and wipe all images;

```
$ bin/houseclean.sh
```
