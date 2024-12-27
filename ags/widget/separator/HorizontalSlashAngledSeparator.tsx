type HorizontalSlashAngledSeparatorProps = {
    className: string;
};


export default function HorizontalSlashAngledSeparator({
    className
}: HorizontalSlashAngledSeparatorProps) {

    return (
        <box className={className}>
            {`\uE0B0`}
        </box>
    );
}