type HorizontalSlashAngledSeparatorProps = {
    index: number;
};


export default function HorizontalSlashAngledSeparator({
    index
}: HorizontalSlashAngledSeparatorProps) {

    return (
        <box className={`horizontal_slash_angled_separator-${index}`}>
            {`\uE0B0`}
        </box>
    );
}