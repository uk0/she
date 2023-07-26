## she

> 记录一些小脚本，慢慢更新之前的硬盘坏了好多脚本都无了，现在慢慢整理。

### 脚本列表

__cpuinfo.sh__ 这个脚本将打印出过去一秒的 CPU 使用量和空闲量，单位为核心数，结果保留两位小数。
<br>
__group_by_type.sh__  传入一个绝对路径你将获得目录下面的所有类型的数量以及大小。


**awk 常用使用方式：**

1. 打印某一列：`awk '{print $1}' filename`。这会打印文件 `filename` 的第一列。

2. 打印多列：`awk '{print $1,$3}' filename`。这会打印文件 `filename` 的第一列和第三列。

3. 条件打印：`awk '$1=="keyword" {print $0}' filename`。如果第一列等于 "keyword"，则打印整行。

4. 计算总和：`awk '{sum+=$1} END {print sum}' filename`。这会计算文件 `filename` 的第一列的总和。

**sed 常用使用方式：**

1. 替换文本：`sed 's/foo/bar/g' filename`。这会将文件 `filename` 中的 "foo" 替换为 "bar"。

2. 删除行：`sed '/pattern/d' filename`。这会删除文件 `filename` 中匹配 "pattern" 的所有行。

3. 插入文本：`sed '1 i\Text' filename`。这会在文件 `filename` 的第一行前插入 "Text"。

4. 修改行：`sed '3 c\New text' filename`。这会将文件 `filename` 的第三行替换为 "New text"。

**Linux 运维日常使用的脚本列表：**

1. **监控脚本**：这些脚本可以定期检查系统的 CPU 使用率、内存使用率、磁盘空间、网络流量等，并在超出阈值时发送警报。

2. **备份脚本**：这些脚本可以将重要的文件或数据库定期备份到另一台服务器或云存储服务。

3. **日志处理脚本**：这些脚本可以定期压缩、备份、删除旧的日志文件，以防止磁盘空间耗尽。

**日志处理和备份示例脚本：**

```bash
#!/bin/bash

# 设置日志文件路径
LOG_PATH="/var/log"

# 设置备份目录
BACKUP_PATH="/backups"

# 压缩并备份旧的日志文件
find $LOG_PATH -name "*.log" -mtime +30 | while read LOG_FILE; do
    echo "Archiving $LOG_FILE"
    tar czf "$BACKUP_PATH/$(basename $LOG_FILE).tar.gz" "$LOG_FILE"
    rm "$LOG_FILE"
done
```

这个脚本会找到 `/var/log` 目录下所有30天以上的 `.log` 文件，然后将这些文件压缩并备份到 `/backups` 目录，并删除这些旧的日志文件。你可以根据你的实际情况修改这个脚本。
