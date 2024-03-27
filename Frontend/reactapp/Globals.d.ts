// declare module '*.scss' {
//     const content: Record<string, string>;
//     export default content;
// }
// declare module "*.css" {
//     export default {
//         [index: string]: string;
// }
// }
// declare module "*.module.css";
// declare module "*.module.scss";
declare module "*.module.css";
declare module "*.module.scss";
// declaration.d.ts
declare module '*.scss' {
    const content: Record<string, string>;
    export default content;
}