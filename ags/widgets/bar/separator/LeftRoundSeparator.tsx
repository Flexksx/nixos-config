type LeftRoundSeparatorProps = {
    className: string;
};

export default function LeftRoundSeparator({
    className
}: LeftRoundSeparatorProps) {

    return (
        <box className={className}>
            {`\uE0B4`}
        </box>
    );
}
