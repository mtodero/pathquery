But not:
  based on: Pathquery
  preconditions:
    files:
      yourdir/file1.js: contents
      yourdir/file2.js: contents
      yourdir/other_folder/file3.js: contents
      yourdir/other_folder/file4: notjs
      yourdir/node_modules/file5.js: contents
      yourdir/node_modules/file6.js: contents
    code: |
      for path in pathq("yourdir").ext("js").but_not(pathq("yourdir/node_modules")):
            output(path)
  scenario:
    - Output contains:
        expected contents:
          - yourdir/file1.js
          - yourdir/file2.js
          - yourdir/other_folder/file3.js
        but not:
          - yourdir/node_modules/file4
          - yourdir/node_modules/file5